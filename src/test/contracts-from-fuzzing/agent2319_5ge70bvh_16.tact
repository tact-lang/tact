struct C {
    x: Int = 1;
    y: Int = 2;
}

struct B {
    label: String = "label";
    innerC: C;
}

contract TestContract(
    nestedParam: B,
    value: Int,
) {}
