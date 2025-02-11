/*
 * Copyright (c) 2018 Elastos Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

 /*
 * Copyright (c) 2019 ioeXNetwork
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import Foundation

// MARK: Creation & destruction

/**
 * \~English
 * Bootstrap defines a couple of perperities to provide for Carrier nodes
 * to connect with. The bootstrap nodes help Carrier nodes be connected to
 * the others with more higher possibilities.
 */
internal struct CBootstrapNode {
    /**
     * \~English
     * The ip address supported with ipv4 protocol.
     */
    var ipv4: UnsafePointer<Int8>?

    /**
     * \~English
     * The ip address supported with ipv6 protocol.
     */
    var ipv6: UnsafePointer<Int8>?

    /**
     * \~English
     * The ip port.
     * The default value is 33445.
     */
    var port: UnsafePointer<Int8>?

    /**
     * \~English
     * The unique public key to provide for Carrier nodes, terminated
     * by null-string.
     * The length of public key is 64 bytes.
     */
    var public_key: UnsafePointer<Int8>?

    init() {}
}

/**
 * \~English
 * ElaOptions defines several settings that control the way the Carrier
 * node connects to others.
 *
 * @remark
 *      Default values are not defined for persistent_location of Carrier-
 *      Options, so application should be set persistent_location clearly.
 *      If the ElaOptions structure is defined as a static variable,
 *      initialization (in compliant compilers) sets all values to 0 (NULL
 *      for pointers).
 */
internal struct COptions {

    /**
     * \~English
     * The application defined persistent data location.
     * The location must be set.
     */
    var persistent_location: UnsafePointer<Int8>?

    /**
     * \~English
     * The option to decide to use udp transport or not. Setting this option
     * to false will force Carrier node to use TCP only, which will potentially
     * slow down the message to run through.
     */
    var udp_enabled: Bool = true

    /**
     * \~English
     * The total number of bootstrap nodes to connect.
     * There must have at least one bootstrap node for the very first time
     * to create carrier instance.
     */
    var bootstraps_size: Int = 0

    /**
     * \~English
     * The array of bootstrap nodes.
     */
    var bootstraps: UnsafePointer<CBootstrapNode>?

    init() {}
}

/**
 * \~English
 * Get the current version of Carrier node.
 */
@_silgen_name("IOEX_get_version")
internal func IOEX_get_version() -> UnsafePointer<Int8>!

/**
 * \~English
 * Carrier log level to control or filter log output.
 */
internal struct CLogLevel : RawRepresentable, Equatable {

    init(_ rawValue: UInt32) {
        self.rawValue = rawValue
    }

    init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    var rawValue: UInt32
}

/**
 * \~English
 * Log level None
 * Indicate disable log output.
 */
internal var CLogLevel_None: CLogLevel { get { return CLogLevel(0) } }
/**
 * \~English
 * Log level fatal.
 * Indicate output log with level 'Fatal' only.
 */
internal var CLogLevel_Fatal: CLogLevel { get { return CLogLevel(1) } }
/**
 * \~English
 * Log level error.
 * Indicate output log above 'Error' level.
 */
internal var CLogLevel_Error: CLogLevel { get { return CLogLevel(2) } }
/**
 * \~English
 * Log level warning.
 * Indicate output log above 'Warning' level.
 */
internal var CLogLevel_Warning: CLogLevel { get { return CLogLevel(3) } }
/**
 * \~English
 * Log level info.
 * Indicate output log above 'Info' level.
 */
internal var CLogLevel_Info: CLogLevel { get { return CLogLevel(4) } }
/*
 * \~English
 * Log level debug.
 * Indicate output log above 'Debug' level.
 */
internal var CLogLevel_Debug: CLogLevel { get { return CLogLevel(5) } }
/*
 * \~English
 * Log level trace.
 * Indicate output log above 'Trace' level.
 */
internal var CLogLevel_Trace: CLogLevel { get { return CLogLevel(6) } }
/*
 * \~English
 * Log level verbose.
 * Indicate output log above 'Verbose' level.
 */
internal var CLogLevel_Verbose: CLogLevel { get { return CLogLevel(7) } }

/**
 * \~English
 * Carrier node connection status to carrier network.
 */
internal struct CConnectionStatus : RawRepresentable, Equatable {

    init(_ rawValue: Int32) {
        self.rawValue = rawValue
    }

    init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    var rawValue: Int32
}

/**
 * \~English
 * Carrier node connected to the carrier network.
 * Indicate the node is online.
 */
internal var CConnectionStatus_Connected: CConnectionStatus { get { return CConnectionStatus(0) } }
/**
 * \~English
 * There is no connection to the carrier network.
 * Indicate the node is offline.
 */
internal var CConnectionStatus_Disconnected: CConnectionStatus { get { return CConnectionStatus(1) } }

/**
 * \~English
 * Carrier node presence status to friends.
 */
internal struct CPresenceStatus : RawRepresentable, Equatable {

    init(_ rawValue: Int32) {
        self.rawValue = rawValue
    }

    init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    var rawValue: Int32
}

/**
 * \~English
 *  Carrier node is online and available.
 */
internal var CPresenceStatus_None: CPresenceStatus { get { return CPresenceStatus(0) } }
/**
 * \~English
 * * Carrier node is being away.
 */
internal var CPresenceStatus_Away: CConnectionStatus { get { return CConnectionStatus(1) } }

/**
 * \~English
 * Carrier node is being busy.
 */
internal var CPresenceStatus_Busy: CConnectionStatus { get { return CConnectionStatus(2) } }

/**
 * \~English
 * A structure representing the Carrier user information.
 *
 * \~English
 * In SDK, self and all friends are Carrier user, and have
 * same user attributes.
 */
internal struct CUserInfo {

    /**
     * \~English
     * User ID. Read only to application.
     */
    var userid: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * Nickname, also known as display name.
     */
    var name: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * User's description, also known as what's up.
     */
    var description: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * If user has an avatar.
     */
    var has_avatar: Int32 = 0

    /**
     * \~English
     * User's gender.
     */
    var gender: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * User's phone number.
     */
    var phone: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * User's email address.
     */
    var email: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * User's region information.
     */
    var region: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    init() {}
}


/**
 * \~English
 * A structure representing the Carrier friend information.
 *
 * Include the basic user information and the extra friend information.
 */
internal struct CFriendInfo {

    /**
     * \~English
     * Friend's user information.
     */
    var user_info: CUserInfo = CUserInfo()

    /**
     * \~English
     * Your label for the friend.
     */
    var label: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    /**
     * \~English
     * Connection status to carrier network.
     */
    var status: Int32 = CConnectionStatus_Disconnected.rawValue

    /**
     * \~English
     * Friend's presence status.
     */
    var presence: Int32 = CPresenceStatus_None.rawValue

    init() {}
}

internal struct CFileInfo {
    
    /**
     * \~English
     * Friend's user information.
     */
    var file_name: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    
    var file_path: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    
    var friend_number: Int32 = 0
    
    var file_index: Int32 = 0
    
    init() {}
}

/**
 * \~English
 * Carrier callbacks, include all global callbacks for carrier.
 */
internal struct CCallbacks {

    /**
     * \~English
     * An application-defined function that perform idle work.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      context     [in] The application defined context data.
     */
    var idle: (@convention(c) (OpaquePointer?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the self connection status.
     *
     * @param
     *      carrier     [in] A handle to the Carrier nodeinstance.
     * @param
     *      status      [in] Current connection status.
     * @param
     *      context     [in] The application defined context data.
     */
    var connection_status: (@convention(c) (OpaquePointer?, UInt32, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the ready notification.
     * Notice: application should wait this callback invoked before calling any
     * carrier function to interact with friends.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      context     [in] The application defined context data.
     */
    var ready: (@convention(c) (OpaquePointer?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the self info change event.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      info        [in] The ElaUserInfo pointer to the new user info.
     * @param
     *      context     [in] The application defined context data.
     */
    var self_info: (@convention(c) (OpaquePointer?, UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that iterate the each friends list item.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      info        [in] A pointer to ElaFriendInfo structure that
     *                       representing a friend
     * @param
     *      context     [in] The application defined context data.
     *
     * @return
     *      Return true to continue iterate next friend user info,
     *      false to stop iterate.
     */
    var friend_list: (@convention(c) (OpaquePointer?, UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Bool)!

    /**
     * \~English
     * An application-defined function that process the friend connection
     * change event.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The friend's user id.
     * @param
     *      status      [in] Connection status.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_connection: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UInt32, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the friend information
     * change event.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The friend's user id.
     * @param
     *      info        [in] The ElaFriendInfo pointer to the new friend info.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_info: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the friend presence
     * change event.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The friend's user id.
     * @param
     *      presence    [in] The presence status of the friend.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_presence: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UInt32, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the friend request.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      userid      [in] The user id who wants friend with self.
     * @param
     *      info        [in] The user info who wants to friend with self.
     * @param
     *      hello       [in] PIN for target user, or any application defined
     *                       content.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_request: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UnsafeRawPointer?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the new friend added
     * event.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      info        [in] The firend's information.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_added: (@convention(c) (OpaquePointer?, UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the friend removed
     * event.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The friend's user id.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_removed: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the friend messages.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      from        [in] The id from who send the message.
     * @param
     *      msg         [in] The message content.
     * @param
     *      len         [in] The message length in bytes.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_message: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, Int, UnsafeMutableRawPointer?) -> Swift.Void)!

    /**
     * \~English
     * An application-defined function that process the friend invite request.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      from        [in] The user id from who send the invite request.
     * @param
     *      data        [in] The application defined data send from friend.
     * @param
     *      len         [in] The data length in bytes.
     * @param
     *      context     [in] The application defined context data.
     */
    var friend_invite: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, Int, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that process the file query request.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who send the file query request.
     * @param
     *      filename    [in] The name of file which is queried by the friend.
     * @param
     *      message     [in] Extra message sent by the friend.
     * @param
     *      context     [in] The application defined context data.
    */
    var file_queried: (@convention(c) (OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that process the file send request.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who send the file send request.
     * @param
     *      fileindex   [in] The index of the file send by the friend.
     * @param
     *      filename    [in] The name of file which is requested to be sent from friend.
     * @param
     *      filesize    [in] The size of the file in bytes.
     * @param
     *      context     [in] The application defined context data.
    */
    var file_request: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?,UnsafePointer<Int8>?,Int, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that process the control message from a friend.
     * This control message indicates that the friend has accepted our previous send file request.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who accepted our send file request.
     * @param
     *      fileindex   [in] The index of the file that has been accepted.
     * @param
     *      context     [in] The application defined context data.
     */
    var file_accepted: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, Int, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    
    /**
     * \~English
     * An application-defined function that process the control message from a friend.
     * This control message indicates that the friend has rejected our previous send file request.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who rejected our send file request.
     * @param
     *      fileindex   [in] The index of the file that has been rejected.
     * @param
     *      context     [in] The application defined context data.
     */
    var file_rejected: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?,  UnsafeMutableRawPointer?) -> Swift.Void)!
    
    
    /**
     * \~English
     * An application-defined function that process the control message from a friend.
     * This control message indicates that the friend has paused one the currently transmitting file.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who paused the file transmission.
     * @param
     *      fileindex   [in] The index of the file that has been paused.
     * @param
     *      context     [in] The application defined context data.
     */
    var file_paused: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that process the control message from a friend.
     * This control message indicates that the friend has resumed one the currently transmitting file.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who resumed the file transmission.
     * @param
     *      fileindex   [in] The index of the file that has been resumed.
     * @param
     *      context     [in] The application defined context data.
    */
    var file_resumed: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that process the control message from a friend.
     * This control message indicates that the friend has canceled one the currently transmitting file.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      friendid    [in] The user id from who canceled the file transmission.
     * @param
     *      fileindex   [in] The index of the file that has been canceled.
     * @param
     *      context     [in] The application defined context data.
     */
    var file_canceled: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that is called when file transmission is completed.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      fileid      [in] The unique id for this file transmission.
     * @param
     *      friendid    [in] The user id who participant this file transmission.
     * @param
     *      context     [in] The application defined context data.
     */
    var file_completed: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    /**
     * \~English
     * An application-defined function that is called when file transmission is aborted.
     * File transmission abortion is usually caused by the disconnection of the friend.
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      fileid      [in] The unique id for this file transmission.
     * @param
     *      friendid    [in] The user id who participant this file transmission.
     * @param
     *      filename    [in] The name of the file that is transmitting.
     * @param
     *      length      [in] The length of the transmitted data in bytes.
     * @param
     *      filesize    [in] Total size of the file.
     * @param
     *      context     [in] The application defined context data.
    */
    var file_aborted:(@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?, UnsafePointer<Int8>?,Int ,Int, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    
    /**
     * \~
     * An application-defined function that serves as file transmission progress callback
     *
     * @param
     *      carrier     [in] A handle to the Carrier node instance.
     * @param
     *      fileid      [in] The unique id for this file transmission.
     * @param
     *      friendid    [in] The user id who participant this file transmission.
     * @param
     *      fullpath    [in] The path with name of the local file.
     * @param
     *      size        [in] The total size in byte of this file.
     * @param
     *      transferred [in] The transferred size in byte of this file.
     * @param
     *      context     [in] The application defined context data.
     */
    var file_progress: (@convention(c)(OpaquePointer?, UnsafePointer<Int8>?, UnsafePointer<Int8>?,  UnsafePointer<Int8>?, UInt64, UInt64, UnsafeMutableRawPointer?) -> Swift.Void)!
    
    init() {}
}

/**
 * \~English
 * initialize log options for Carrier. The default level to control log output
 * is 'Info'.
 *
 * @param
 *      level       [in] The log level to control internal log output.
 * @param
 *      log_file    [in] the log file name.
 *                       If the log_file is NULL, Carrier will not write
 *                       log to file.
 * @param
 *      log_printer [in] the user defined log printer. can be NULL.
 */

@_silgen_name("IOEX_log_init")
internal func IOEX_log_init(_ level: CLogLevel,
                           _ log_file: UnsafePointer<Int8>!,
                           _ log_printer: (/*@convention(c)*/ (UnsafePointer<Int8>?, CVaListPointer?) -> Swift.Void)!)

/**
 * \~English
 * Check if the carrier address is valid.
 *
 * @param
 *      address     [in] the carrier address to be check.
 *
 * @return
 *      true if address is valid, or false if address is not valid.
 */
@_silgen_name("IOEX_address_is_valid")
internal func IOEX_address_is_valid(_ address: UnsafePointer<Int8>!) ->Bool

/**
 * \~English
 * Check if the carrier ID is valid.
 *
 * @param
 *      id          [in] the carrier id to be check.
 *
 * @return
 *      true if id is valid, or false if id is not valid.
 */
@_silgen_name("IOEX_id_is_valid")
internal func IOEX_id_is_valid(_ id: UnsafePointer<Int8>!) -> Bool


/**
 * \~English
 * Create a new Carrier node instance. after creating the instance, it's
 * ready for connection to Carrier network.
 *
 * @param
 *      options     [in] A pointer to a valid ElaOptions structure.
 * @param
 *      callbacks   [in] The Application defined callback functions.
 * @param
 *      context     [in] The application defined context data.
 *
 * @return
 *      If no error occurs, return the pointer of Carrier node instance.
 *      Otherwise, return NULL, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_new")
internal func IOEX_new(_ options: UnsafePointer<COptions>!,
                      _ callbacks: UnsafeMutablePointer<CCallbacks>!,
                      _ context: UnsafeMutableRawPointer!) -> OpaquePointer!

/**
 * \~English
 * Disconnect from Carrier network, and destroy all associated resources
 * with the Carrier node instance.
 *
 * After calling the function, the Carrier pointer becomes invalid.
 * No other functions can be called.
 *
 * @param
 *      carrier     [in] A handle identifying the Carrier node instance
 *                       to kill.
 */
@_silgen_name("IOEX_kill")
internal func IOEX_kill(_ carrier: OpaquePointer!)

// MARK: - Connection & event loop

/**
 * \~English
 * Attempts to connect the node to Carrier network. If the node successfully
 * connects to Carrier network, then it starts the node's main event loop.
 * The connect options was specified by previously create options.
 * @see IOEX_new().
 *
 * @param
 *      carrier     [in] A handle identifying the Carrier node instance.
 * @param
 *      interval    [in] Internal loop interval, in milliseconds.
 *
 * @return
 *      0 if the node successfully connected to Carrier network and start the
 *      event loop. Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_run")
internal func IOEX_run(_ carrier: OpaquePointer!, _ interval: Int32) -> Int32

// MARK: - Internal node information

/**
 * \~English
 * Get user address associated with the Carrier node.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      address     [out] The buffer that will receive the address.
 *                        The buffer size should at least
 *                        (IOEX_MAX_ADDRESS_LEN + 1) bytes.
 * @param
 *      len         [in] The buffer size of address.
 *
 * @return
 *      The address string pointer, or NULL if buffer is too small.
 */
@_silgen_name("IOEX_get_address")
internal func IOEX_get_address(_ carrier: OpaquePointer!,
                              _ address: UnsafeMutablePointer<Int8>!,
                              _ len: Int) -> UnsafeMutablePointer<Int8>!

/**
 * \~English
 * Get node identifier associated with this Carrier node.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      nodeid      [out] The buffer that will receive the identifier.
 *                        The buffer size should at least
 *                        (IOEX_MAX_ID_LEN + 1) bytes.
 * @param
 *      len         [in] The buffer size of nodeid.
 *
 * @return
 *      The nodeId string pointer, or NULL if buffer is too small.
 */
@_silgen_name("IOEX_get_nodeid")
internal func IOEX_get_nodeid(_ carrier: OpaquePointer!,
                             _ nodeid: UnsafeMutablePointer<Int8>!,
                             _ len: Int) -> UnsafeMutablePointer<Int8>!

/**
 * \~English
 * Get user identifier associated with this Carrier node.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      userid      [out] The buffer that will receive the identifier.
 *                        The buffer size should at least
 *                        (IOEX_MAX_ID_LEN + 1) bytes.
 * @param
 *      len         [in] The buffer size of userid.
 *
 * @return
 *      The userId string pointer, or NULL if buffer is too small.
 */
@_silgen_name("IOEX_get_userid")
internal func IOEX_get_userid(_ carrier: OpaquePointer!,
                             _ userid: UnsafeMutablePointer<Int8>!,
                             _ len: Int) -> UnsafeMutablePointer<Int8>!

// MARK: - node information

/**
 * \~Egnlish
 * Update the nospam for Carrier address.
 *
 * Update the 4-byte nospam part of the Carrier address with host byte order
 * expected. Nospam for Carrier address is used to eliminate spam friend
 * request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      nospam      [in] An 4-bytes unsigned integer.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_set_self_nospam")
internal func IOEX_set_self_nospam(_ carrier: OpaquePointer!,
                                  _ nospam: UInt32) -> Int32

/**
 * \~Egnlish
 * Get the nospam for Carrier address.
 *
 * Get the 4-byte nospam part of the Carrier address with host byte order
 * expected. Nospam for Carrier address is used to eliminate spam friend
 * request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      nospam      [in] An unsigned integer pointer to receive nospam value.
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_get_self_nospam")
internal func IOEX_get_self_nospam(_ carrier: OpaquePointer!,
                                  _ nospam: UnsafeMutablePointer<UInt32>!) -> Int32
/**
 * \~English
 * Update self information.
 *
 * As self information changed, Carrier node would update itself information
 * to Carrier network, which would forward the change to all friends.
 * nodes.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      info        [in] The ElaUserInfo pointer to the updated user info.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_set_self_info")
internal func IOEX_set_self_info(_ carrier: OpaquePointer!,
                                _ info: UnsafePointer<CUserInfo>!) -> Int32
/**
 * \~English
 * Get self information.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      info        [in] The ElaUserInfo pointer to receive user info.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_get_self_info")
internal func IOEX_get_self_info(_ carrier: OpaquePointer!,
                                _ info: UnsafeMutablePointer<CUserInfo>!) -> Int32

/**
 * \~English
 * Set self presence status.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      presence    [in] the new presence status.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_set_self_presence")
internal func IOEX_set_self_presence(_ carrier: OpaquePointer!,
                                    _ status: CPresenceStatus) -> Int32
/**
 * \~English
 * Get self presence status.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      presence    [in] A pointer to receive presence status value.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_get_self_presence")
internal func IOEX_get_self_presence(_ carrier: OpaquePointer!,
                                    _ status: UnsafeMutablePointer<CPresenceStatus>) -> Int32

/**
 * \~English
 * Check if Carrier node instance is being ready.
 *
 * All carrier interactive APIs should be called only if carrier instance
 * is being ready.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 *
 * @return
 *      true if the carrier node instance is ready, or false if not.
 */
@_silgen_name("IOEX_is_ready")
internal func  IOEX_is_ready(_ carrier: OpaquePointer!) -> Bool


// MARK: - Friend information

/**
 * \~English
 * An application-defined function that iterate the each friends list item.
 *
 * ElaFriendsIterateCallback is the callback function type.
 *
 * @param
 *      info        [in] A pointer to ElaFriendInfo structure that
 *                       representing a friend
 * @param
 *      context     [in] The application defined context data.
 *
 * @return
 *      Return true to continue iterate next friend user info,
 *      false to stop iterate.
 */
internal typealias CFriendsIterateCallback = @convention(c)
    (UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Bool

/**
 * \~English
 * Get friends list. For each friend will call the application defined
 * iterate callback.
 *
 * @param
 *      carrier     [in] a handle to the Carrier node instance.
 * @param
 *      callback    [in] a pointer to ElaFriendsIterateCallback function.
 * @param
 *      context     [in] the application defined context data.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_get_friends")
internal func IOEX_get_friends(_ carrier: OpaquePointer!,
                              _ callback: CFriendsIterateCallback!,
                              _ context: UnsafeMutableRawPointer!) -> Int32

/**
 * \~English
 * Get friend information.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      friendid    [in] The friend's user id.
 * @param
 *      info        [in] The ElaFriendInfo pointer to receive the friend
 *                       information.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_get_friend_info")
internal func IOEX_get_friend_info(_ carrier: OpaquePointer!,
                                  _ friendid: UnsafePointer<Int8>!,
                                  _ info: UnsafeMutablePointer<CFriendInfo>!) -> Int32

/**
 * \~English
 * Set the label of the specified friend.
 *
 * If the value length is 0 or value is NULL, the attribute will be cleared.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      friendid    [in] The friend's user id.
 * @param
 *      label       [in] the new label of the specified friend.
 *
 * @return
 *      0 on success, or -1 if an error occurred. The specific error code
 *      can be retrieved by calling IOEX_get_error().
 *
 * @remarks
 *      The label of a friend is a private alias named by yourself. It can be
 *      seen by yourself only, and has no impact to the target friend.
 */
@_silgen_name("IOEX_set_friend_label")
internal func IOEX_set_friend_label(_ carrier: OpaquePointer!,
                                   _ friendid: UnsafePointer<Int8>!,
                                   _ label: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * Check if the user ID is friend.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      userid      [in] The userid to check.
 *
 * @return
 *      true if the user id is friend, or false if not;
 */
@_silgen_name("IOEX_is_friend")
internal func IOEX_is_friend(_ carrier: OpaquePointer!,
                            _ userid: UnsafePointer<Int8>!) -> Bool


// MARK: - Friend add & remove

/**
 * \~English
 * Attempt to add friend by sending a new friend request.
 *
 * This function will add a new friend with specific address, and then
 * send a friend request to the target node.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      address     [in] The target user address.
 * @param
 *      hello       [in] PIN for target user, or any application defined
 *                       content.
 *
 * @return
 *      0 if adding friend is successful. Otherwise, return -1, and a specific
 *      error code can be retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_add_friend")
internal func IOEX_add_friend(_ carrier: OpaquePointer!,
                             _ userid: UnsafePointer<Int8>!,
                             _ hello: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * Accept the friend request.
 *
 * This function is used to add a friend in response to a friend request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      userid      [in] The user id to who wants to be friend with us.
 *
 * @return
 *      0 if adding friend successfully.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_accept_friend")
internal func IOEX_accept_friend(_ carrier: OpaquePointer!,
                                _ userid: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * Remove a friend.
 *
 * This function will send a remove friend indicator to Carrier network.
 *
 * If all correct, Carrier network will clean the friend relationship, and
 * send friend removed message to both.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      friendid    [in] The target user id.
 *
 * @return
 *      0 if the indicator successfully sent.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_remove_friend")
internal func IOEX_remove_friend(_ carrier: OpaquePointer!,
                                _ friendid: UnsafePointer<Int8>!) -> Int32


// MARK: - Application transactions between friends

/**
 * \~English
 * Send a message to a friend.
 *
 * The message length may not exceed IOEX_MAX_APP_MESSAGE_LEN, and message
 * itself should be text-formatted. Larger messages must be split by application
 * and sent as separate messages. Other carrier nodes can reassemble the
 * fragments.
 *
 * Message may not be empty or NULL.
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      to          [in] The target userid.
 * @param
 *      msg         [in] The message content defined by application.
 * @param
 *      len         [in] The message length in bytes.
 *
 * @return
 *      0 if the text message successfully sent.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_send_friend_message")
internal func IOEX_send_friend_message(_ carrier: OpaquePointer!,
                                      _ to: UnsafePointer<Int8>!,
                                      _ msg: UnsafePointer<Int8>!,
                                      _ len: Int) -> Int32

/**
 * \~English
 * An application-defined function that process the friend invite response.
 *
 * CarrierFriendInviteResponseCallback is the callback function type.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      from        [in] The target user id.
 * @param
 *      status      [in] The status code of the response.
 *                       0 is success, otherwise is error.
 * @param
 *      reason      [in] The error message if status is error, or NULL
 * @param
 *      data        [in] The application defined data return by target user.
 * @param
 *      len         [in] The data length in bytes.
 * @param
 *      context     [in] The application defined context data.
 */
internal typealias CFriendInviteResponseCallback = @convention(c)
    (OpaquePointer?, UnsafePointer<Int8>?, Int32, UnsafePointer<Int8>?, UnsafePointer<Int8>?, Int, UnsafeMutableRawPointer?) -> Swift.Void


/**
 * \~English
 * Send invite request to a friend.
 *
 * Application can attach the application defined data within the invite
 * request, and the data will send to target friend.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      to          [in] The target userid.
 * @param
 *      data        [in] The application defined data send to target user.
 * @param
 *      len         [in] The data length in bytes.
 * @param
 *      callback    [in] A pointer to ElaFriendInviteResponseCallback
 *                       function to receive the invite response.
 * @param
 *      context      [in] The application defined context data.
 *
 * @return
 *      0 if the invite request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_invite_friend")
internal func IOEX_invite_friend(_ carrier: OpaquePointer!,
                                _ to: UnsafePointer<Int8>!,
                                _ data: UnsafePointer<Int8>!,
                                _ len: Int,
                                _ callback: CFriendInviteResponseCallback!,
                                _ context: UnsafeMutableRawPointer!) -> Int32

/**
 * \~English
 * Reply the friend invite request.
 *
 * This function will send a invite response to friend.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      to          [in] The userid who send invite request.
 * @param
 *      status      [in] The status code of the response.
 *                       0 is success, otherwise is error.
 * @param
 *      reason      [in] The error message if status is error, or NULL
 *                       if success.
 * @param
 *      data        [in] The application defined data send to target user.
 *                       If the status is error, this will be ignored.
 * @param
 *      len         [in] The data length in bytes.
 *                       If the status is error, this will be ignored.
 *
 * @return
 *      0 if the invite response successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_reply_friend_invite")
internal func IOEX_reply_friend_invite(_ carrier: OpaquePointer!,
                                      _ to: UnsafePointer<Int8>!,
                                      _ status: Int32,
                                      _ reason: UnsafePointer<Int8>!,
                                      _ data: UnsafePointer<Int8>!,
                                      _ len: Int) -> Int32

/******************************************************************************
 * File transmitting
 *****************************************************************************/

/**
 * \~English
 * An application-defined function that iterate the each file transmission.
 *
 * IOEXFilesIterateCallback is the callback function type.
 *
 * @param
 *      info        [in] A pointer to IOEXTrackerInfo structure that
 *                       representing a file transmission.
 * @param
 *      context     [in] The application defined context data.
 *
 * @return
 *      Return true to continue iterate next file info,
 *      false to stop iterate.
typedef bool IOEXFilesIterateCallback(int direction, const IOEXTrackerInfo *info, void *context);
 */
internal typealias CFilesIterateCallback = @convention(c)( UnsafeRawPointer?, UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Bool

/**
 * \~English
 * An application-defined function that process the file query request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      friendid    [in] The user id whom we send the file query to.
 * @param
 *      filename    [in] The name of file we are querying for.
 * @param
 *      message     [in] Extra message we sent to friend.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
*/
@_silgen_name("IOEX_send_file_query")
internal func IOEX_send_file_query(_ carrier: OpaquePointer!,
                                     _ friendid: UnsafePointer<Int8>!,
                                     _ filename: UnsafePointer<Int8>!,
                                     _ message: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * An application-defined function that process the file send request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [out] The buffer that used to store base58 encoded file id.
 *                        The size of the buffer should >= IOEX_MAX_ID_LEN (45).
 * @param
 *      id_len      [in] Size of the fileid buffer. It should >= IOEX_MAX_ID_LEN (45)
 * @param
 *      friendid    [in] The user id whom we send the file send request to.
 * @param
 *      filename    [in] The name of file which is requested to be sent from friend.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
  */
@_silgen_name("IOEX_send_file_request")
internal func IOEX_send_file_request(_ carrier: OpaquePointer!,
                                       fileid: UnsafeMutablePointer<Int8>!,
                                       id_len: Int,
                                       friendid: UnsafePointer<Int8>!,
                                       filename: UnsafePointer<Int8>!) -> UnsafeMutablePointer<Int8>!

/**
 * \~English
 * An application-defined function that accepts a file send request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [in] The unique id of the file that will be accepted.
 * @param
 *      filename    [in] Rename the file as filename.
 * @param
 *      filepath    [in] The path to store the file.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
*/
@_silgen_name("IOEX_send_file_accept")
internal func IOEX_send_file_accept(_ carrier: OpaquePointer!,
                                     _ fileid: UnsafePointer<Int8>!,
                                     _ filename: UnsafePointer<Int8>!,
                                     _ filepath: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * An application-defined function that sends file seek control.
 * This function must be called right after the file request is received, and before sending accept.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [in] The unique id of the file that will be seeked.
 * @param
 *      position    [in] The start position of the file that should be sent.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_send_file_seek")
internal func IOEX_send_file_seek(_ carrier: OpaquePointer!,
                                    fileid: UnsafePointer<Int8>!,
                                  _ position: UnsafePointer<Int8>!) -> Int32


/**
 * \~English
 * An application-defined function that rejects a file send request.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [in] The unique id of the file that will be rejected.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
  */
@_silgen_name("IOEX_send_file_reject")
internal func IOEX_send_file_reject(_ carrier: OpaquePointer!,
                                       fileid: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * An application-defined function that pause a file transmission.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [in] The unique id of the file that will be paused.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_send_file_pause")
internal func IOEX_send_file_pause(_ carrier: OpaquePointer!,
                                    fileid: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * An application-defined function that resume a file transmission.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [in] The unique id of the file that will be resumed.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_send_file_resume")
internal func IOEX_send_file_resume(_ carrier: OpaquePointer!,
                                   fileid: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * An application-defined function that cancels a file transmission.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileid      [in] The unique id of the file that will be canceled.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
 */
@_silgen_name("IOEX_send_file_cancel")
internal func IOEX_send_file_cancel(_ carrier: OpaquePointer!,
                                    fileid: UnsafePointer<Int8>!) -> Int32

/**
 * \~English
 * An application-defined function that iteratively get file info.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      callback    [in] The iteration callback that will be called.
 * @param
 *      context     [in] The application defined context data.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
*/
@_silgen_name("IOEX_get_files")
internal func IOEX_get_files(_ carrier: OpaquePointer!,
                             _ callback: CFilesIterateCallback!,
                             _ context: UnsafeMutableRawPointer!) -> Int32

/**
 * \~English
 * An application-defined function that get file info.
 *
 * @param
 *      carrier     [in] A handle to the Carrier node instance.
 * @param
 *      fileinfo    [out] The buffer to store the file transmission info.
 * @param`
 *      fileid      [in] The unique id of the file transmission.
 * @return
 *      0 if the request successfully send to the friend.
 *      Otherwise, return -1, and a specific error code can be
 *      retrieved by calling IOEX_get_error().
  */
@_silgen_name("IOEX_get_file_info")
internal func IOEX_get_file_info(_ carrier: OpaquePointer!,
                             _ fileinfo: UnsafeMutablePointer<CFileInfo>!,
                             _ fileid: UnsafePointer<Int8>!) -> Int32
 // MARK: - Error handling

/*
 * \~English
 * Retrieves the last-error code value. The last-error code is maintained on a
 * per-instance basis. Multiple instance do not overwrite each other's
 * last-error code.
 *
 * @return
 *      The return value is the last-error code.
 */
@_silgen_name("IOEX_get_error")
internal func IOEX_get_error() -> Int32

/**
 * \~English
 * Clear the last-error code of a Carrier instance.
 */
@_silgen_name("IOEX_clear_error")
internal func IOEX_clear_error()
