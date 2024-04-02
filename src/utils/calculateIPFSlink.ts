import { importer } from "ipfs-unixfs-importer";
import { MemoryBlockstore } from "blockstore-core/memory";

export async function calculateIPFSlink(data: Buffer) {
    const blockstore = new MemoryBlockstore();
    const cid = await new Promise<string>((resolve, reject) => {
        (async () => {
            try {
                for await (const entry of importer(
                    { content: data },
                    blockstore,
                )) {
                    resolve(entry.cid.toString());
                }
            } catch (e) {
                reject(e);
            }
        })();
    });
    return "ipfs://" + cid;
}
