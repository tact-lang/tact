struct AA {
    a: Int;
}

struct BB {
    b: Int;
    aa: AA?;
}

contract OptionalStructField {
    data: BB;

    init() {
        self.data = BB{ b: 123, aa: null };
    }
}
