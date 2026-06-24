contract TestIfSimple {
    receive() {
         if (true) { dump(1); }
    }
}
