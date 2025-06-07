struct Demo {
    x: Int = 1;
    y: Bool?;
}

contract TestContract {
    foo: Demo?; // optional persistent struct with implicit null
}