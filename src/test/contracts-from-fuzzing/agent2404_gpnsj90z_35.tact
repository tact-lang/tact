// struct with Int as uint4, Bool and String, test serializations together
struct Tiny {
    x: Int as uint4;
    flag: Bool;
    s: String;
}

contract TinyContract {
    data: Tiny;
    init() {
        self.data = Tiny{x:5, flag:true, s:"x"};
    }
}