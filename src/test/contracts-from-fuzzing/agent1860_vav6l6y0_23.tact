struct StrangeOrder {
    b: Bool;
    i: Int;
    s: String;
}

contract WrongOrder {
    val: StrangeOrder = StrangeOrder{
        b:true, i:42, s:"hi"
    };
}