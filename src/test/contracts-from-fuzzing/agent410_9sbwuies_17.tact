struct Flags {
    a: Bool?; 
    b: Int?; 
    c: String?;
}

struct Wrapper {
    flags: Flags;
    note: String;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            flags: Flags{
                a: null,
                b: 42,
                c: null
            },
            note: "edge"
        };
    }
}
