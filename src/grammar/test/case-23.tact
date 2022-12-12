primitive Int;

trait SomeTrait {
    a: Int;

    virtual fun a(): Int {
        return a;
    }
}

contract Main with SomeTrait {
    b: Int;

    overwrite fun a(): Int {
        return b;
    }
}