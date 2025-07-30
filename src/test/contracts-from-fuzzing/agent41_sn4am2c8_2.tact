struct BigFlat {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
}

contract TestContract {
    receive() {
        let instance: BigFlat = BigFlat {
            a1: 1, a2: 2, a3: 3, a4: 4, a5: 5,
            a6: 6, a7: 7, a8: 8, a9: 9, a10: 10
        };
        let sum = instance.a1 + instance.a2 + instance.a3 + instance.a4 + instance.a5 +
                  instance.a6 + instance.a7 + instance.a8 + instance.a9 + instance.a10;
    }
}
