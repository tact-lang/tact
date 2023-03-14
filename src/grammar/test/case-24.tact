primitive Int;

trait SomeTrait {
    a: Int;

    virtual fun a(): Int {
        return a;
    }
}

contract Main with SomeTrait {
    b: Int;

    overrides fun a(): Int {
        return "hello world!";
    }
}