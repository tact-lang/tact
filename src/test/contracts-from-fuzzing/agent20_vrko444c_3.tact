contract RecursiveF {
    receive() {
        // Recursive initialization call: initOf on self
        let s: StateInit = initOf RecursiveF();
    }
}
