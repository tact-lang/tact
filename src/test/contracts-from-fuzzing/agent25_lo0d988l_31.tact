// Deeply nested struct with multiple optional Address and String fields
struct AddrBlock {
    main: Address;
    label: String?;
    backup: Address?;
}

struct Holder {
    first: AddrBlock?;
    second: AddrBlock?;
}

contract TestContract {
    blockHolder: Holder;

    init() {
        self.blockHolder = Holder{
            first: null,
            second: null,
        };
    }
}