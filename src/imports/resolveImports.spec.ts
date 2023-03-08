import { resolveImports } from './resolveImports';
import { createNodeFileSystem } from '../vfs/createNodeFileSystem';
import path from 'path';

describe('resolveImports', () => {
    it('should resolve imports', () => {
        let project = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'project'));
        let stdlib = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'stdlib'));
        let resolved = resolveImports({
            project,
            stdlib,
            entrypoint: './main.tact'
        });
        expect(resolved).toMatchObject({
            "func": [
                {
                    "code": "",
                    "path": path.resolve(__dirname, '__testdata', 'stdlib', 'stdlib2.fc'),
                },
            ],
            "tact": [
                {
                    "code": "import \"./stdlib2.fc\";",
                    "path": path.resolve(__dirname, '__testdata', 'stdlib', 'stdlib.tact'),
                },
                {
                    "code": "",
                    "path": path.resolve(__dirname, '__testdata', 'project', 'imported.tact'),
                },
                {
                    "code": "import \"./imported\";",
                    "path": path.resolve(__dirname, '__testdata', 'project', 'main.tact'),
                },
            ],
        });
    });
});