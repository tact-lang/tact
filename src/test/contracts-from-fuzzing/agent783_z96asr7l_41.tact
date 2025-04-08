struct ANested {
    x: Int;
    y: String;
}

contract NestedPersDefault {
    st: ANested = ANested { x: 1, y: "hi" };
}