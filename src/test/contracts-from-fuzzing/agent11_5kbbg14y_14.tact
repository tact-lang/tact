contract TestTernary {
    receive() {
        dump(true ? 100 : 200);
        dump(false ? "Yes" : "No");
    }
}
