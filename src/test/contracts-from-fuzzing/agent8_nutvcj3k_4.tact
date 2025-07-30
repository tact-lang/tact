contract Test {
    receive() {
        dump(7 / 2);   // expecting 3: 7/2 = 3.5 truncates to 3
        dump(-7 / 2);  // expecting -4: because away from zero, i.e., floor(-3.5) = -4
    }
}
