primitive Int;

trait OtherTrait {
    c: Int;
}

trait SomeTrait with OtherTrait, {
    a: Int;
}

contract Main with SomeTrait, {
    b: Int;
}
