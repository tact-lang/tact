/// Test 5: Deep nested hierarchical initialization (5 levels)

contract Level5 {
    init(v: Int) {
        // Level5 initialization, no further initOf calls
    }
}

contract Level4 {
    init(v: Int) {
        // Level4 initializes Level5 with v+1
        let _ = initOf Level5(v + 1);
    }
}

contract Level3 {
    init(v: Int) {
        // Level3 initializes Level4 with v*2
        let _ = initOf Level4(v * 2);
    }
}

contract Level2 {
    init(v: Int) {
        // Level2 initializes Level3 with v + 10
        let _ = initOf Level3(v + 10);
    }
}

contract Level1 {
    init(v: Int) {
        // Level1 initializes Level2 with v - 3
        let _ = initOf Level2(v - 3);
    }
}

contract EntryPoint {
    init() {
        // Start the deep nested initialization chain with Level1
        let _ = initOf Level1(10);
    }
}
