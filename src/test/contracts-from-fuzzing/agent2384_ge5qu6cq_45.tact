struct SerialOrder {
    first: Int;
    second: Bool;
    third: String;
}

contract SerialOrderContract {
    data: SerialOrder;

    init() {
        self.data = SerialOrder{first:1,second:true,third:"x"};
    }
}