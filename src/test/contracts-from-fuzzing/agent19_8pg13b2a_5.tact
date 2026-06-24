contract TestAdd {
    receive() {
       let res: Int = 10 + 20;
       dump(res);
    }
}
