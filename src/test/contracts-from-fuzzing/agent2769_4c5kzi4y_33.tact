struct Double {
    a: Int;
    b: String;
}

contract InlineDeepInit {
    val: Double = Double{a:99,b:"hi"};
}