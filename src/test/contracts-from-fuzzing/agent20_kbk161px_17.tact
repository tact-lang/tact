contract TestContract {
    receive() {
        let b = beginString();
        b.append("Hello ");
        b.append("world!");
        let final = b.toString();
        final.hashData();
    }
}