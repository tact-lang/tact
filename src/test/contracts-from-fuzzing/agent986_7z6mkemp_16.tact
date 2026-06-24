struct O1 {
    x: Int?;
}

struct O2 {
    o: O1?;
}

contract OptionalNest {
    data: O2;

    init() {
        self.data = O2{ o:null };
    }
}
