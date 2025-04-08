struct SS {
    s1: String;
    s2: String?;
}

contract TestContract {
    data: SS = SS{ s1: "abc", s2: null };

    init() {
        self.data = SS{ s1: "def", s2: "ghi" };
    }
}