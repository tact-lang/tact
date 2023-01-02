
message Deploy {
    queryId: Int as uint64;
}

message DeployOk {
    queryId: Int as uint64;
}

trait Deployable {
    receive(deploy: Deploy) {
        reply(abi.pack_cell(DeployOk{queryId: deploy.queryId}));
    }
}