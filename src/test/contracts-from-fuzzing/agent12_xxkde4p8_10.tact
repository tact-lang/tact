struct Many { one: Int; two: Int; three: Int; fans: Int }

fun ignore(s: Many): Int {
    // Destructure the struct, ignoring all fields except 'fans'
    let Many { fans, .. } = s;
    return fans;
}

contract TestIgnore {
    receive() {
        let m: Many = Many { one: 10, two: 20, three: 30, fans: 40 };
        ignore(m);
    }
}
