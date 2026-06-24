contract TestIfValid {
    receive() {
        if (true) { dump("if true"); } else { dump("if false"); }
    }
}
