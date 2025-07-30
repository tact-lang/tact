contract TestContract {
    receive() {
        let s = beginString();
        s.append("Hello");
        s.append(" ");
        s.append("World!");
        let res = s.toString();
        dump(res);
    }
}