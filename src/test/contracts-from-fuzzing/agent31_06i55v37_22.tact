struct Many { one: Int; two: Int; three: Int; four: Int }

fun ignoreFields(s: Many) {
    let Many { one, .. } = s;
    dump(one);
}

contract Test {
    receive() {
        ignoreFields(Many { one: 123, two: 456, three: 789, four: 101 });
    }
}
