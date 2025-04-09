// struct with slice/string/address optionals + serialization + nesting
struct AddOn {
    addr: Address?;
    str: String?;
    sl: Slice?;
}

contract OptionalPointers {
    data: AddOn;
    init() {
        self.data = AddOn{ addr:null, str:null, sl:null };
    }
}