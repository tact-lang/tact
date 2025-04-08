struct SomeStruct {
    a: Int;
    b: Int;
}

contract RedeclareFields(
    s: SomeStruct,
    a: Int,
) {
    // Should conflict if both exist together
}