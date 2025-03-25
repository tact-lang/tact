//transfer#5fcc3d14 queryId:uint64 new_owner:MsgAddress response_destination:MsgAddress custom_payload:(Maybe ^Cell) forward_amount:(VarUInteger 16) forward_payload:(Either Cell ^Cell) = InternalMsgBody;
message(0x5fcc3d14) Transfer{
    queryId: Int as uint64;
    newOwner: Address;
    responseDestination: Address?; // can be addr_none$00 without storing MayBe bit 
    customPayload: Cell?; 
    forwardAmount: Int as coins;
    forwardPayload: Slice as remaining;
}

message(0x2fcb26a2) GetStaticData {
    queryId: Int as uint64;
}

struct NFTData{
    init: Int;
    itemIndex: Int as uint64;
    collectionAddress: Address;
    owner: Address?;
    content: Cell?;
}

struct InitNFTBody {
    owner: Address;
    content: Cell;
}

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