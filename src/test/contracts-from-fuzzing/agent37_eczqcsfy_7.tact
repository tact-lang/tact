contract MapContract {
    myMap: map<Int, Int>;

    receive() {
        dump(self.myMap.get(1));
    }
}