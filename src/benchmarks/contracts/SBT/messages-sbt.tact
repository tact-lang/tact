//transfer#5fcc3d14 queryId:uint64 new_owner:MsgAddress response_destination:MsgAddress custom_payload:(Maybe ^Cell) forward_amount:(VarUInteger 16) forward_payload:(Either Cell ^Cell) = InternalMsgBody;
message(0x5fcc3d14) Transfer {
    queryId: Int as uint64;
    newOwner: Address;
    responseDestination: Address?; // can be addr_none$00 without storing MayBe bit 
    customPayload: Cell?;
    forwardAmount: Int as coins;
    forwardPayload: Slice as remaining;
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

struct InitNFTBody {
    owner: Address;
    content: Cell;
}

// issue blocker for this is https://github.com/tact-lang/tact/issues/2275
// struct InitNFTBodyDict {
//     amount: Int as coins;
//     initNFTBody: Cell; // ^InitNFTBody
// }

struct CollectionData {
    nextItemIndex: Int as uint64;
    collectionContent: Cell;
    owner: Address;
}

struct RoyaltyParams {
    nominator: Int as uint16;
    dominator: Int as uint16;
    owner: Address;
}

message(0x693d3950) GetRoyaltyParams {
    queryId: Int as uint64;
}

message(1) DeployNFT {
    queryId: Int as uint64;
    itemIndex: Int as uint64;
    amount: Int as coins;
    initNFTBody: Cell; // ^InitNFTBody
}

message(2) BatchDeploy {
    queryId: Int as uint64;
    deployList: Cell; // map<Int as uint64, InitNFTBodyDict> 
}

message(3) ChangeOwner {
    queryId: Int as uint64;
    newOwner: Address;
}

message(0xa8cb00ad) ReportRoyaltyParams {
    queryId: Int as uint64;
    params: RoyaltyParams;
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

message(0x2fcb26a2) GetStaticData {
    queryId: Int as uint64;
}

message(0x8b771735) ReportStaticData {
    queryId: Int as uint64;
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
