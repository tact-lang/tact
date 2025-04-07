message(0x5fcc3d14) Transfer {
    queryId: Int as uint64;
}

struct NFTData {
    init: Int;
    itemIndex: Int as uint64;
    collectionAddress: Address;
    owner: Address?;
    content: Cell?;
}

struct InitNFTData {
    collectionAddress: Address;
    itemIndex: Int as uint64;
}

message(0xd0c3bfea) RequestOwner {
    queryId: Int as uint64;
    destination: Address;
    body: Cell;
    withContent: Bool;
}

message(0x0dd607e3) RequestOwnerOut {
    queryId: Int as uint64;
    index: Int as uint256;
    senderAddress: Address;
    ownerAddress: Address;
    body: Cell;
    revokedAt: Int as uint64;
    content: Cell?;
}

message(0x04ded148) ProveOwnership {
    queryId: Int as uint64;
    destination: Address;
    body: Cell;
    withContent: Bool;
}

message(0x0524c7ae) ProveOwnershipOut {
    queryId: Int as uint64;
    index: Int as uint256;
    ownerAddress: Address;
    body: Cell;
    revokedAt: Int as uint64;
    content: Cell?;
}

message(0xc18e86d2) ProveOwnershipBounced {
    queryId: Int as uint64;
}

message(0x2fcb26a2) GetStaticData {
    queryId: Int as uint64;
}

message(0x8b771735) ReportStaticData {
    queryId: Int as uint64;
    index: Int as uint256;
    collectionAddress: Address;
}

message(0xd136d3b3) TakeExcess {
    queryId: Int as uint64;
}

message(0xd53276db) ExcessOut {
    queryId: Int as uint64;
}

message(0x1f04537a) Destroy {
    queryId: Int as uint64;
}

message(0x6f89f5e3) Revoke {
    queryId: Int as uint64;
}
