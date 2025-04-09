struct AltOrder {
    third: Int;
    first: Bool;
    second: String;
}

contract WeirdSort {
    alt: AltOrder;
    init() {
        self.alt = AltOrder{
            first:true,
            second:"hi",
            third:7
        };
    }
}