struct Many { one: Int; two: Int; three: Int }

contract DestructureDiscardTest {
    receive() {
        let m = Many { one: 1, two: 2, three: 3 };
        let Many { one, .. } = m;
        dump(one);
    }
}
