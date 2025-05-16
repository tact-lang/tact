struct Strs {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestContract {
    s: Strs;
    init() {
        self.s = Strs{
            a:"one",
            b:"two",
            c:"three",
            d:"four",
            e:"five"
        };
    }
}