fun test_nested_ternary() {
    let x = (true ? (false ? 1 : 2) : 3);
    dump(x);
}
