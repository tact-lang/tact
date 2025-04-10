contract MainContract {
    receive("augmented assign operators") {
        let a = 100;

        a += 10;
        a -= 10;

        let b = true;

        b &&= true;
        b ||= true;
    }
}
