struct ExampleStruct {
    a: Int;
}

message ExampleMessage {
    b: Int;
}

fun example() {
    let a = ExampleStruct{a: 1};
    let b = ExampleMessage{b: 2};
}