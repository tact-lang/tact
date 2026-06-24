// Init struct inside param list
struct InitStruct {
    x: Int;
    y: Bool;
}

contract Test(
    initValue: InitStruct,
    another: Int,
) {}