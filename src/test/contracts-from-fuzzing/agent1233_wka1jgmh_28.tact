// Optional Address in struct
struct AddrStruct {
    a: Address?;
}

contract OptionalAddressStorage {
    data: AddrStruct;

    init() {
        self.data = AddrStruct{a: null};
    }
}