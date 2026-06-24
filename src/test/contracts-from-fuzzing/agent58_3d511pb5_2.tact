contract TestIf {
    receive() {
         if (true) { let x: Int = 10; dump(x); }
    }
}
