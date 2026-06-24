struct ABoolStr {
    a: Int;
    b: Bool;
    s: String;
}

contract WithStructDefault {
    val: ABoolStr = ABoolStr{a:10,b:true,s:"default"};
}
