contract GetterInit {
    get fun getSelfState(): StateInit {
        return initOf GetterInit();
    }
}
