message BounceData {
    info: String;
}

contract StandardBounce {
    bounced(msg: bounced<BounceData>) {
        // Standard bounce receiver handling typed BounceData
    }
}
