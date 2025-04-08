struct MaybeData {
    text: String?;
    addr: Address?;
}

contract TestContract {
    md: MaybeData;
    
    init() {
        self.md = MaybeData{
            text: null,
            addr: null
        };
    }
}