struct X {
    intVal: Int;
}

contract InlineStructInContract {
    x: X = X{intVal: 42};
}