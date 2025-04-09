struct Inner1 {
    p: Int?;
    q: Bool?;
}

struct Inner2 {
    r: Inner1?;
    s: Address?;
}

struct Inner3 {
    t: Inner2?;
    u: String?;
}

contract TestContract {
    data: Inner3;
    init() {
        self.data = Inner3{
            t: null,
            u: null
        };
    }
}
