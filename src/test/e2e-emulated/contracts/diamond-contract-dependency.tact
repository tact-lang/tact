contract NoDependencies {
    receive() {
        // This contract has no dependencies
    }
    get fun getState(): StateInit {
        return initOf NoDependencies();
    }
}

contract OneDependency {

    param: Int as uint32; // To make two different contracts

    init(initParam: Int) {
        self.param = initParam;
    }
    
    receive() {
        // This contract has one dependency
    }
    get fun getDep(): StateInit {
        return initOf NoDependencies();
    }

    get fun getState(): StateInit {
        return initOf OneDependency(self.param);
    }
}

contract TwoDependencies {

    param: Int as coins = 0; // This one is different from OneDependency
    
    receive() {
        // This contract has two dependencies
    }

    get fun getFirstDep(): StateInit {
        return initOf OneDependency(0);
    }

    get fun getSecondDep(): StateInit {
        return initOf OneDependency(1);
    }

    get fun getNoDep(): StateInit {
        return initOf NoDependencies();
    }

    get fun getState(): StateInit {
        return initOf TwoDependencies();
    }
}