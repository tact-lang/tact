struct StrangelyOrdered {
    first: Int;
    second: String;
    third: Bool;
    fourth: String;
    fifth: Int;
    sixth: Bool;
}

contract UnusualOrder {
    data: StrangelyOrdered = StrangelyOrdered{
        first: 1,
        second: "2",
        third: true,
        fourth: "4",
        fifth: 5,
        sixth: false
    };

    init() {
        self.data = StrangelyOrdered{
            first: 10,
            second: "20",
            third: false,
            fourth: "40",
            fifth: 50,
            sixth: true
        };
    }
}
