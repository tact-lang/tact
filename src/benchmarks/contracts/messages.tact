const TakeWalletAddressOpcode: Int = 0xd1735400;

// notcoin
message(0xd372158c) TopUp {
    queryId: Int as uint64;
}

message(0x6501f354) ChangeAdmin {
    queryId: Int as uint64;
    nextAdmin: Address;
}

message(0xfb88e119) ClaimAdmin {
    queryId: Int as uint64;
}

message(0x7431f221) DropAdmin {
    queryId: Int as uint64;
}
