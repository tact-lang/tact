struct Mid {
    flag: Bool;
    number: Int?;
}

contract OptionalPrimitiveInside {
    data: Mid = Mid{ flag: true, number: null };

    receive() {
        self.data;
    }
}