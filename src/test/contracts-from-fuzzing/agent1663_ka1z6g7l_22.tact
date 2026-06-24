struct AB {
    a: Int;
    b: Bool;
}

contract OrderError {
    data: AB;

    init() {
        self.data = AB{
            b: true,
            a: 5
        };
    }
}