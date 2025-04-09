struct Wraps {
    i: Int;
    s: String;
}

contract InlineInit {
    w: Wraps = Wraps{ i:7,s:"hi" };
}