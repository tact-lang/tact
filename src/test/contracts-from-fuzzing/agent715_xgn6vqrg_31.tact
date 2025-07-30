struct MyStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: MyStruct?; // probably defaults null

    receive(){}
}