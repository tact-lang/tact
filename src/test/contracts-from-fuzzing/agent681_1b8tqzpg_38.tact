struct SS { foo: Int; }

contract DeepDefaultField {
    bar: SS = SS{foo:123};
}